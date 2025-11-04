import { Injectable, OnModuleDestroy, OnModuleInit } from '@nestjs/common';
import * as mysql from 'mysql2/promise';
import * as dotenv from 'dotenv';

dotenv.config();

@Injectable()
export class DatabaseService implements OnModuleInit, OnModuleDestroy {
  pool!: mysql.Pool;

  async onModuleInit() {
    this.pool = mysql.createPool({
      host: process.env.DB_HOST || 'mysql-31f4baac-gbox-45fa.d.aivencloud.com',
      port: +(process.env.DB_PORT || 17827),
      user: process.env.DB_USER || 'avanadmin',
      password: process.env.DB_PASSWORD || 'AVNs_dwB91jmbUq2zFwa4NNq',
      database: process.env.DB_NAME || 'defaultdb',
      waitForConnections: true,
      connectionLimit: 10,
      queueLimit: 0,
    });

    const conn = await this.pool.getConnection();
    await conn.ping();
    conn.release();
    console.log('MySQL pool created');
  }

  async onModuleDestroy() {
    await this.pool.end();
  }

  getPool() {
    return this.pool;
  }
}
