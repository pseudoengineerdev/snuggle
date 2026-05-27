import { IsBoolean, IsInt, Max, Min } from 'class-validator';

export class CompanionStatePreviewDto {
  @IsInt()
  @Min(0)
  @Max(365)
  missedCareDays!: number;

  @IsBoolean()
  knownServerOutage!: boolean;

  @IsBoolean()
  notificationFailure!: boolean;

  @IsBoolean()
  paymentIssue!: boolean;

  @IsBoolean()
  knownClientBug!: boolean;
}
