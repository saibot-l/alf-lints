Opinionated Dart lints to maintain a clean folder structure.

## Features

- Ensures code is split into
  - **a**pp: composes features and libraries
  - **l**ibraries: shared libraries usable by the app itself and features
  - **f**eatures: stand-alone features usable by the app itself
- Supports monorepos

## Installation

1. Add [alf_lints](https://pub.dev/packages/alf_lints) and [custom_lint](https://pub.dev/packages/custom_lint) to your `pubspec.yaml`:
   ```yaml
   dev_dependencies:
     alf_lints:
     custom_lint:
   ```
2. Enable [custom_lint](https://pub.dev/packages/custom_lint) in your `analysis_options.yaml`:
   ```yaml
   analyzer:
     plugins:
       - custom_lint
   ```

## Application structure

This linter proposes a folder structure containing

- `entry points`:
  - Starting point(s) of the application
  - Should be named `main.dart`, `main_<flavor>` or `<package-name>.dart`.
  - Can not be imported
  - Can only import from
    - `app`
    - `features`
    - `libraries`
- `app` folder:
  - Composes features and libraries and bundles them into the actual application
  - Can only be imported from
    - `entry points`
  - Can only import from
    - `app`
    - `features`
    - `libraries`
- `features` folder:
  - Isolated features not dependent on each other
  - Can only be imported from
    - `app`
    - `entry points`
  - Can only import from
    - `libraries`
- `libraries` folder:
  - Collections of shared code
  - A library is always grouped in a directory
  - Can only be imported from
    - `app`
    - `entry points`
    - `features`
    - `libraries`
  - Can only import from
    - `libraries`

The actual file structure should look something like this:

```
<my-appplication>/
├─ bin/
│  ├─ <entry-point>.dart
├─ lib/
│  ├─ src/
│  │  ├─ app/
│  │  ├─ features/
│  │  ├─ libraries/
│  ├─ <entry-point>.dart
```

### Monorepo

It is also possible to structure your project with local packages:

```
apps/
├─ <my-app>/
│  ├─ bin/
│  │  ├─ <entry-point>.dart
│  ├─ lib/
│  │  ├─ src/
│  │  │  ├─ app/
│  │  │  ├─ features/
│  │  │  ├─ libraries/
│  │  ├─ <entry-point>.dart
packages/
├─ features/
│  ├─ <my-feature>/
│  │  ├─ lib/
│  │  │  ├─ src/
│  │  │  │  ├─ app/
│  │  │  │  ├─ features/
│  │  │  │  ├─ libraries/
│  │  │  ├─ <my-feature>.dart
├─ libraries/
│  ├─ <my-library>/
│  │  ├─ lib/
│  │  │  ├─ src/
│  │  │  │  ├─ app/
│  │  │  │  ├─ features/
│  │  │  │  ├─ libraries/
│  │  │  ├─ <my-library>.dart
```

## Lints

<details>
  <summary>avoid_import_app_from_feature</summary>

  - Ensures that features don't import composing app code.
</details>

<details>
  <summary>group_alf</summary>

  - Ensures that files are placed and named according to the alf-linting conventions. Files should either
    - be a valid entry point placed in `lib/` or `bin/` directory and named `main.dart`, `main_<flavor>.dart` or `<packageName>.dart`
    - or placed within the `app`, `libraries` or `features` folder contained in the `lib/` or `lib/src/` folder.
</details>

<details>
  <summary>group_libraries</summary>

  - Ensures that files within the `libraries` folder are grouped into another folder.
</details>