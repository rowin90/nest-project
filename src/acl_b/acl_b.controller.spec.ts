import { Test, TestingModule } from '@nestjs/testing';
import { AclBController } from './acl_b.controller';
import { AclBService } from './acl_b.service';

describe('AclBController', () => {
  let controller: AclBController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [AclBController],
      providers: [AclBService],
    }).compile();

    controller = module.get<AclBController>(AclBController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
