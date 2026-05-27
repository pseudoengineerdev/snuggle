import { Injectable } from '@nestjs/common';
import { CompanionStatePreviewDto } from './dto/companion-state-preview.dto';

export enum CompanionState {
  HAPPY = 'happy',
  HUNGRY = 'hungry',
  SICK = 'sick',
  WARNING = 'warning',
  LEGACY = 'legacy',
}

export type CompanionStateResult = {
  state: CompanionState;
  allowsLegacyTransition: boolean;
  reason: string;
};

@Injectable()
export class CareService {
  previewCompanionState(input: CompanionStatePreviewDto): CompanionStateResult {
    const isProtectedWindow =
      input.knownServerOutage ||
      input.notificationFailure ||
      input.paymentIssue ||
      input.knownClientBug;

    const allowsLegacyTransition = !isProtectedWindow;

    if (input.missedCareDays === 0) {
      return {
        state: CompanionState.HAPPY,
        allowsLegacyTransition,
        reason: 'No missed-care days detected.',
      };
    }

    if (input.missedCareDays <= 2) {
      return {
        state: CompanionState.HUNGRY,
        allowsLegacyTransition,
        reason: 'Day 1-2 missed care produces a gentle hungry/sleepy state.',
      };
    }

    if (input.missedCareDays <= 6) {
      return {
        state: CompanionState.SICK,
        allowsLegacyTransition,
        reason: 'Day 3-6 missed care escalates to sick/wilted.',
      };
    }

    if (input.missedCareDays <= 9) {
      return {
        state: CompanionState.WARNING,
        allowsLegacyTransition,
        reason: 'Day 7-9 remains in final warning and recovery window.',
      };
    }

    if (isProtectedWindow) {
      return {
        state: CompanionState.WARNING,
        allowsLegacyTransition: false,
        reason:
          'Legacy transition is blocked because outage/notification/payment/bug protections are active.',
      };
    }

    return {
      state: CompanionState.LEGACY,
      allowsLegacyTransition: true,
      reason:
        'Day 10+ missed care with no protected conditions enters gentle legacy state.',
    };
  }
}
