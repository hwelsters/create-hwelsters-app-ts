/** @type {import('ts-jest').JestConfigWithTsJest} */

module.exports = {
  preset: "ts-jest",
  testEnvironment: "node",
  moduleDirectories: ["node_modules", "src"],
  setupFiles: ["<rootDir>/__tests__/config/set_env.ts"],
  testMatch: ["**/?(*.)+(test).ts"],

  moduleNameMapper: {
    '^@root/(.*)$': '<rootDir>/src/$1'
  },
};
