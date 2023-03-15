/** @type {import('ts-jest').JestConfigWithTsJest} */
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  moduleDirectories: ['node_modules', 'src'],
  setupFiles: ["<rootDir>/tests/config/set_env.ts"],
  testMatch: ['**/?(*.)+(test).ts']
}
