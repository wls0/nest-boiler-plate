# yarn husky 파일 셋팅

# Pre-commit 파일 경로 설정
PRE_COMMIT_FILE=".husky/pre-commit"

# Husky 디렉토리 생성 (필요 시)
mkdir -p "$(dirname -- "$PRE_COMMIT_FILE")"

# Pre-commit 파일 작성
cat > "$PRE_COMMIT_FILE" << 'EOF'
#!/usr/bin/env sh
. "$(dirname -- "$0")/_/husky.sh"

yarn lint-staged --no-stash
EOF


# yarn package.json 파일 생성
echo '{
  "name": "basic",
  "version": "0.0.0",
  "description": "",
  "author": "",
  "private": true,
  "license": "UNLICENSED",
  "scripts": {
    "build": "nest build",
    "format": "prettier --write \\"src/**/*.ts\\" \\"test/**/*.ts\\"",
    "start": "nest start",
    "start:debug": "NODE_ENV=dev nest start --debug --watch",
    "start:prod": "NODE_ENV=prod node dist/main",
    "lint": "eslint \\"{src,apps,libs,test}/**/*.ts\\" --fix",
    "test": "jest",
    "test:watch": "jest --watch",
    "test:cov": "jest --coverage",
    "test:debug": "node --inspect-brk -r tsconfig-paths/register -r ts-node/register node_modules/.bin/jest --runInBand",
    "test:e2e": "jest --config ./test/jest-e2e.json"
  },
  "dependencies": {},
  "devDependencies": {},
  "jest": {
    "moduleFileExtensions": [
      "js",
      "json",
      "ts"
    ],
    "rootDir": "src",
    "testRegex": ".*\\\.spec\\\.ts$",
    "transform": {
      "^.+\\\.(t|j)s$": "ts-jest"
    },
    "collectCoverageFrom": [
      "**/*.(t|j)s"
    ],
    "coverageDirectory": "../coverage",
    "testEnvironment": "node"
  },
  "lint-staged": {
    "src/**/*.{ts,tsx}": [
      "yarn format",
      "yarn lint"
    ]
  }
}' > package.json

yarn add @nestjs/common @nestjs/config @nestjs/core @nestjs/platform-express nest-winston reflect-metadata rxjs winston

yarn add --dev @nestjs/cli @nestjs/schematics @nestjs/testing @types/express @types/jest @types/node @types/supertest @typescript-eslint/eslint-plugin @typescript-eslint/parser eslint eslint-config-prettier eslint-plugin-import eslint-plugin-prettier eslint-plugin-promise eslint-plugin-sort-class-members eslint-plugin-unused-imports husky jest lint-staged prettier source-map-support supertest ts-jest ts-loader ts-node tsconfig-paths typescript 
