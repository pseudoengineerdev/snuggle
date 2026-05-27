import { Module } from '@nestjs/common';
import { CouplesController } from './couples.controller';

@Module({
  controllers: [CouplesController],
})
export class CouplesModule {}
