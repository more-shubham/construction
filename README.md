# Construction Monorepo

Welcome to the **Construction** project monorepo.

## Project Structure
- [`web/`](./web): Mobile-first, 100% client-side Progressive Web Application (PWA) built with Next.js, TypeScript, Tailwind CSS, and shadcn/ui. Linked as a private Git submodule referencing [`more-shubham/construction-web`](https://github.com/more-shubham/construction-web).

## Submodule Setup
To clone this repository along with its submodules:
```bash
git clone --recurse-submodules https://github.com/more-shubham/construction.git
```
Or to initialize submodules after cloning:
```bash
git submodule update --init --recursive
```
