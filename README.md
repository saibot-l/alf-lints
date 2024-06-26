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
  - Should be directly placed in the `bin` or `lib` folder.
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
│  ├─ app/
│  ├─ features/
│  ├─ libraries/
│  ├─ <entry-point>.dart
```

---

1. Probably you will either have entry point(s) within the `bin` or `lib` folder. Not in both.
2. You can also nest `app`, `features` and `libraries` in a `src` folder.

### Monorepo

It is also possible to structure your project with local packages:

```
<my-app>/
├─ bin/
│  ├─ <entry-point>.dart
├─ lib/
│  ├─ app/
│  ├─ features/
│  ├─ libraries/
│  ├─ <entry-point>.dart
features/
├─ <my-feature>/
│  ├─ lib/
│  │  ├─ src/
│  │  ├─ <my-feature>.dart
libraries/
├─ <my-library>/
│  ├─ lib/
│  │  ├─ src/
│  │  ├─ <my-library>.dart
```

---

1. It's enough to use this lint within the main application(s). Just make sure you don't accidentally import features from other features or libraries.
2. You can also nest `app`, `features` and `libraries` in a `src` folder.

## Lints

<details>
  <summary>avoid_import_app_from_feature</summary>

- Ensures that features don't import composing app code.
</details>

<details>
  <summary>avoid_import_app_from_library</summary>

- Ensures that libraries don't import composing app code.
</details>

<details>
  <summary>avoid_import_entry_point</summary>

- Ensures that no code imports entry points.
</details>

<details>
  <summary>avoid_import_feature_from_library</summary>

- Ensures that libraries don't import features.
</details>

<details>
  <summary>avoid_import_other_feature_from_feature</summary>

- Ensures that features don't import other features.
</details>

<details>
  <summary>group_alf</summary>

- Ensures that files are placed and named according to the alf-linting conventions. Files should either - be a valid entry point placed in `lib/` or `bin/` directory and named `main.dart`, `main_<flavor>.dart` or `<packageName>.dart` - or placed within the `app`, `libraries` or `features` folder contained in the `lib/` or `lib/src/` folder.
</details>

<details>
  <summary>group_libraries</summary>

- Ensures that files within the `libraries` folder are grouped into another folder.
</details>
