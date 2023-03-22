/** @type {import('ts-jest').JestConfigWithTsJest} */

import type {Config} from 'jest';

const config : Config = {
  preset: "ts-jest",
  testEnvironment: "node",
  moduleDirectories: ["node_modules", "src"],
  setupFiles: ["<rootDir>/__tests__/config/set_env.ts"],
  testMatch: ["**/?(*.)+(test).ts"],

  moduleNameMapper: {
    '^@root/(.*)$': '<rootDir>/src/$1'
  },
};

export default config