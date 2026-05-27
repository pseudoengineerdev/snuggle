import { Body, Controller, Get, Post, Query } from '@nestjs/common';
import { CreateMoodCheckInDto } from './dto/create-mood-check-in.dto';
import { MoodsService } from './moods.service';

@Controller('moods')
export class MoodsController {
  constructor(private readonly moodsService: MoodsService) {}

  @Post('check-ins')
  createCheckIn(@Body() dto: CreateMoodCheckInDto) {
    return this.moodsService.createCheckIn(dto);
  }

  @Get('check-ins')
  listCheckIns(@Query('limit') limit?: number) {
    return this.moodsService.listRecent(limit);
  }
}
