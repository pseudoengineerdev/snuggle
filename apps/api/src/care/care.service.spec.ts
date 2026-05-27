import { CareService, CompanionState } from './care.service';

describe('CareService', () => {
  const service = new CareService();

  it('maps day 1 missed care to hungry', () => {
    const result = service.previewCompanionState({
      missedCareDays: 1,
      knownServerOutage: false,
      notificationFailure: false,
      paymentIssue: false,
      knownClientBug: false,
    });

    expect(result.state).toBe(CompanionState.HUNGRY);
  });

  it('maps day 3 missed care to sick', () => {
    const result = service.previewCompanionState({
      missedCareDays: 3,
      knownServerOutage: false,
      notificationFailure: false,
      paymentIssue: false,
      knownClientBug: false,
    });

    expect(result.state).toBe(CompanionState.SICK);
  });

  it('keeps day 7 in warning window', () => {
    const result = service.previewCompanionState({
      missedCareDays: 7,
      knownServerOutage: false,
      notificationFailure: false,
      paymentIssue: false,
      knownClientBug: false,
    });

    expect(result.state).toBe(CompanionState.WARNING);
  });

  it('blocks legacy transition during protected outage conditions', () => {
    const result = service.previewCompanionState({
      missedCareDays: 10,
      knownServerOutage: true,
      notificationFailure: false,
      paymentIssue: false,
      knownClientBug: false,
    });

    expect(result.state).toBe(CompanionState.WARNING);
    expect(result.allowsLegacyTransition).toBe(false);
  });

  it('allows legacy transition after day 10 with no protected flags', () => {
    const result = service.previewCompanionState({
      missedCareDays: 10,
      knownServerOutage: false,
      notificationFailure: false,
      paymentIssue: false,
      knownClientBug: false,
    });

    expect(result.state).toBe(CompanionState.LEGACY);
    expect(result.allowsLegacyTransition).toBe(true);
  });
});
