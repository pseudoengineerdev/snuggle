import { Controller, Get } from '@nestjs/common';

@Controller('couples')
export class CouplesController {
  @Get('profile')
  getCoupleProfile() {
    return {
      coupleDisplayName: 'Aarav + Maya',
      daysTogether: 412,
      joinedAt: '2026-04-10',
      privacyCenterEnabled: true,
      reminder: 'Replace this fixture with authenticated couple profile data.',
    };
  }
}
