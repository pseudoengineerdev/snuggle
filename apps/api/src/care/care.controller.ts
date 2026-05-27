import { Body, Controller, Post } from '@nestjs/common';
import { CompanionStatePreviewDto } from './dto/companion-state-preview.dto';
import { CareService } from './care.service';

@Controller('care')
export class CareController {
  constructor(private readonly careService: CareService) {}

  @Post('companion/state-preview')
  previewCompanionState(@Body() dto: CompanionStatePreviewDto) {
    return this.careService.previewCompanionState(dto);
  }
}
