#!/bin/bash
set -e  # Exit on error

cd "$(dirname "$0")"  # Ensure script runs from `lambdas/`

echo "Detecting Lambda functions..."
LAMBDA_FUNCTIONS=$(ls -d */ | sed 's|/||')
echo "Found Lambda functions: $LAMBDA_FUNCTIONS"

for lambda in $LAMBDA_FUNCTIONS; do
  if [ -f "$lambda/esbuild.js" ]; then
    echo "Building $lambda..."
    (cd "$lambda" && pnpm exec node esbuild.js)

    echo "Zipping $lambda..."
    (cd "$lambda/dist" && zip -r "../$lambda.zip" lambda.js)
  else
    echo "Skipping $lambda (no esbuild.js found)"
  fi
done

echo "Running Terraform..."
cd ../terraform
terraform apply -auto-approve
