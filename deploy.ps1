param(
    [string]$Target = "all"
)

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

function Show-Help {
    Write-Host "Usage: .\deploy.ps1 [target]" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Targets:"
    Write-Host "  all                  Deploy both backend and frontend (default)"
    Write-Host "  frontend | web       Deploy frontend only (Next.js -> S3/CloudFront)"
    Write-Host "  backend  | api       Deploy backend only (Docker -> ECR/App Runner)"
    Write-Host "  -h, -help            Show this help message"
}

function Deploy-Backend {
    Write-Host "=========================================" -ForegroundColor Magenta
    Write-Host "🚀 Deploying Backend..." -ForegroundColor Magenta
    Write-Host "=========================================" -ForegroundColor Magenta
    & "$PSScriptRoot\backend\deploy.ps1"
}

function Deploy-Frontend {
    Write-Host "=========================================" -ForegroundColor Cyan
    Write-Host "🚀 Deploying Frontend..." -ForegroundColor Cyan
    Write-Host "=========================================" -ForegroundColor Cyan
    & "$PSScriptRoot\web\deploy.ps1"
}

switch ($Target.ToLower()) {
    "all" {
        Deploy-Backend
        Write-Host ""
        Deploy-Frontend
    }
    { $_ -in @("frontend", "web") } {
        Deploy-Frontend
    }
    { $_ -in @("backend", "api") } {
        Deploy-Backend
    }
    { $_ -in @("-h", "--help", "-help", "help") } {
        Show-Help
        exit 0
    }
    default {
        Write-Host "Unknown target: $Target" -ForegroundColor Red
        Write-Host ""
        Show-Help
        exit 1
    }
}

Write-Host ""
Write-Host "🎉 Deployment completed successfully!" -ForegroundColor Green
