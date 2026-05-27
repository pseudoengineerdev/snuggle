import { Controller, Get } from '@nestjs/common';

@Controller('memories')
export class MemoriesController {
  @Get('rules')
  getMemoryRules() {
    return {
      canBackdateBeforeJoinDate: false,
      joinDateBoundaryRule: 'Memory dates can only be created from couple join date forward in v1.',
      storageMode: 'limited_in_free_tier',
      mediaPrivacy: 'private_to_couple',
    };
  }
}
