import { Test, TestingModule } from '@nestjs/testing';
import { AclAService } from './acl_a.service';

describe('AclAService', () => {
  let service: AclAService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AclAService],
    }).compile();

    service = module.get<AclAService>(AclAService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
