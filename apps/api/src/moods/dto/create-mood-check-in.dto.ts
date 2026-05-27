import { IsEnum, IsOptional, IsString, MaxLength } from 'class-validator';

export enum MoodType {
  RELAXED = 'relaxed',
  AMAZING = 'amazing',
  EXCITED = 'excited',
  HAPPY = 'happy',
  GRATEFUL = 'grateful',
  FLIRTATIOUS = 'flirtatious',
  CUDDLY = 'cuddly',
  CUTE = 'cute',
  SAD = 'sad',
  STRESSED = 'stressed',
  ANXIOUS = 'anxious',
  ANGRY = 'angry',
  LONELY = 'lonely',
  TIRED = 'tired',
  BORED = 'bored',
  OKAY = 'okay',
}

export class CreateMoodCheckInDto {
  @IsEnum(MoodType)
  mood!: MoodType;

  @IsOptional()
  @IsString()
  @MaxLength(280)
  note?: string;
}
