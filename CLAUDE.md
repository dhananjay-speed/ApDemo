# Project context for Claude Code

<!-- Fill these in for your app. Every agent reads this file. -->

## App
- iOS app written in Swift (SwiftUI, MVVM; OpenWeatherMap forecast demo)
- Project: `CMExpertise Precticle.xcodeproj`  (no workspace — use `-project`, not `-workspace`)
- Main scheme: `CMExpertise Precticle`
- Test scheme: none configured
- Simulator: `platform=iOS Simulator,name=iPhone 17`

## Non-negotiable engineering rules
- Mirror the architecture, concurrency model and conventions of the closest existing analogous component. Never invent new architecture.
- Exhaustive enum handling (no `default:` that hides new cases).
- Safe decoding: no force unwraps / `try!` on network or persisted data.
- UI updates on the main actor only.
- Accessibility labels/traits on every interactive element.
- No hardcoded user-facing strings (use localization) and no hardcoded design tokens (use the design system).
- Never commit secrets, API keys, or tokens. Never touch production configs.

## Workflow
- Plans live in `docs/plans/<feature-slug>.md`.
- Order of work: recon → modeling → logic → view → wiring → QA.
- If something is ambiguous on architecture, API shape, or gating logic: STOP and ask.
