import { MigrationInterface, QueryRunner } from 'typeorm';

export class PostRefactoring1687146572095 implements MigrationInterface {
  async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE "post" ALTER COLUMN "title" RENAME TO "name"`,
    );
  }

  async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE "post" ALTER COLUMN "name" RENAME TO "title"`,
    ); // 恢复"up"方法所做的事情
  }
}
