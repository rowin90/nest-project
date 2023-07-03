import { Test, TestingModule } from '@nestjs/testing';
import { AclAController } from './acl_a.controller';
import { AclAService } from './acl_a.service';

describe('AclAController', () => {
  let controller: AclAController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [AclAController],
      providers: [AclAService],
    }).compile();

    controller = module.get<AclAController>(AclAController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
