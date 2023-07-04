import { TypeOrmModuleOptions } from '@nestjs/typeorm';

export const databaseConfig: {
  [key: string]: TypeOrmModuleOptions;
} = {
  db1: {
    type: 'mysql',
    host: '192.168.30.42',
    port: 3306,
    username: 'root',
    password: 'guang',
    database: 'typeorm_test',
    synchronize: true,
    logging: true,
    entities: [__dirname + '/../entities/db1/*.module{.ts,.js}'],
    poolSize: 10,
    connectorPackage: 'mysql2',
    extra: {
      // authPlugin: 'sha256_password',
    },
    migrationsTableName: 'custom_migration_table',
    migrations: [__dirname + '../migration/*.js'],
  },
  // ACL权限
  db2: {
    type: 'mysql',
    host: '192.168.30.42',
    port: 3306,
    username: 'root',
    password: 'guang',
    database: 'acl_test',
    entities: [__dirname + '/../entities/db2/**/*.entity{.ts,.js}'],
    synchronize: true,
    poolSize: 10,
    connectorPackage: 'mysql2',
    logging: true,
    // extra: {
    //   authPlugin: 'sha256_password',
    // },
  },
  redis: {
    host: '192.168.30.42',
    port: 6379,
  },
};

export const redisConfig: {
  [key: string]: any;
} = {
  redis: {
    host: '192.168.30.42',
    port: 6379,
  },
};
