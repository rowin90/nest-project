import { Test, TestingModule } from '@nestjs/testing';
import { AclBService } from './acl_b.service';

describe('AclBService', () => {
  let service: AclBService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [AclBService],
    }).compile();

    service = module.get<AclBService>(AclBService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
