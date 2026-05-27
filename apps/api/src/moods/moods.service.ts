import { Injectable } from '@nestjs/common';
import { randomUUID } from 'node:crypto';
import {
  CreateMoodCheckInDto,
  MoodType,
} from './dto/create-mood-check-in.dto';

export type MoodRecord = {
  id: string;
  mood: MoodType;
  note?: string;
  createdAt: string;
};

@Injectable()
export class MoodsService {
  private readonly records: MoodRecord[] = [];

  createCheckIn(dto: CreateMoodCheckInDto): MoodRecord {
    const record: MoodRecord = {
      id: randomUUID(),
      mood: dto.mood,
      note: dto.note,
      createdAt: new Date().toISOString(),
    };

    this.records.unshift(record);
    return record;
  }

  listRecent(limit = 20): MoodRecord[] {
    return this.records.slice(0, limit);
  }
}
