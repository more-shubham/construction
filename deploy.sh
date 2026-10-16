#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET="${1:-all}"

show_help() {
  echo "Usage: ./deploy.sh [target]"
  echo ""
  echo "Targets:"
  echo "  all                  Deploy both backend and frontend (default)"
  echo "  frontend | web       Deploy frontend only (Next.js -> S3/CloudFront)"
  echo "  backend  | api       Deploy backend only (Docker -> ECR/App Runner)"
  echo "  -h, --help           Show this help message"
}

deploy_backend() {
  echo "========================================="
  echo "🚀 Deploying Backend..."
  echo "========================================="
  "${DIR}/backend/deploy.sh"
}

deploy_frontend() {
  echo "========================================="
  echo "🚀 Deploying Frontend..."
  echo "========================================="
  "${DIR}/web/deploy.sh"
}

case "${TARGET}" in
  all)
    deploy_backend
    echo ""
    deploy_frontend
    ;;
  frontend|web)
    deploy_frontend
    ;;
  backend|api)
    deploy_backend
    ;;
  -h|--help)
    show_help
    exit 0
    ;;
  *)
    echo "Unknown target: ${TARGET}"
    echo ""
    show_help
    exit 1
    ;;
esac

echo ""
echo "🎉 Deployment completed successfully!"
