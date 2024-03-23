#!/bin/bash

# Install NPM dependencies
npm install

# Copy the .env.example file to .env, if .env doesn't already exist
if [ ! -f ".env" ]; then
  cp .env.example .env
fi

# Explicitly set the DATABASE_URL to the default Postgres URL
export DATABASE_URL="postgresql://postgres:postgres@localhost:5432/postgres?schema=public"

# Run the Prisma CLI to run migrations and generate the Prisma client
npx prisma migrate dev
