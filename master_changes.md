Working version changelog, used as a base for the changelog and the release
note.
Prefixes used to help generate release notes, changes, and blog posts:
* ✘ Possibly scripts breaking changes
* ◈ New option/command/subcommand
* [BUG] for bug fixes
* [NEW] for new features (not a command itself)
* [API] api updates 🕮
If there is changes in the API (new non optional argument, function renamed or
moved, etc.), please update the _API updates_ part (it helps opam library
users)

## Version
  * Bump to 2.2.0~alpha3~dev [#5615 @rjbou]

## Global CLI
  * Fix `OPAMVERBOSE` setting, 0 and 1 levels was inverted: eg, "no" gives level 1, and "yes" level 0 [#5686 @smorimoto]

## Plugins

## Init

## Config report

## Actions

## Install

## Remove

## Switch

## Config

## Pin

## List

## Show

## Var/Option

## Update / Upgrade

## Tree
  * Allow packages with a specific version, directories or local opam files, as input [#5613 @kit-ty-kate]
  * Add handling of `--recurse` and `--subpath` for directory arguments [#5613 @kit-ty-kate]

## Exec

## Source

## Lint
  * Fix extra-files handling when linting packages from repositories, see #5068 [#5639 @rjbou]
  * Allow to mark a set of warnings as errors using a new syntax -W @1..9 [#5652 @kit-ty-kate @rjbou - fixes #5651]

## Repository
  * Fix `OPAMCURL` and `OPAMFETCH` handling [#5607 @rjbou - fix #5597]

## Lock

## Clean

## Opamfile
  * Update populating extra-files fields log [#5640 @rjbou]

## External dependencies

## Format upgrade

## Sandbox
  * Make /tmp writable again to restore POSIX compliancy [#5634 #5662 @kit-ty-kate - fixes #5462]

## VCS

## Build
  * Remove `bigarray` dependency [#5612 @kit-ty-kate]
  * Remove use of deprecated `Printf.kprintf" [#5612 @kit-ty-kate]
  * Fix "make cold" on Windows when gcc is available [#5635 @kit-ty-kate - fixes #5600]

## Infrastructure
  * Test OCaml 5.0 and 5.1 in CI [#5672 @kit-ty-kate]

## Release scripts
  * Add ppc64le and s390x support [#5420 @kit-ty-kate]

## Admin
  * Add `add-extrafiles` command to add, check, and update `extra-files:` field according files present in `files/` directory [#5647 @rjbou]

## Opam installer

## State

## Opam file format

## Solver

## Client

## Shell

## Internal

## Internal: Windows

## Test

## Reftests
### Tests
  * Lint: add test for W53, to test extra file with good hash [#5639 @rjbou]
  * Add several checksum & cache validation checks for archive, extra-source section, and extra-file field [#5560 @rjbou]
  * Move local-cache into archive-field-checks test [#5560 @rjbou]
  * Admin: add `admin add-extrafiles` test cases [#5647 @rjbou]
  * Add download test, to check `OPAMCURL/OPAMFETCH` handling [#5607 @rjbou]
  * Add `core/opamSystem.ml` specific tests, to test command resolution [#5600 @rjbou]
  * Add test for `OpamCoreConfig`, to check `OPAMVERBOSE` values [#5686 @rjbou]

### Engine
  * With real path resolved for all opam temp dir, remove `/private` from mac temp dir regexp [#5654 @rjbou]
  * Reimplement `sed-cmd` command regexp, to handle prefixed commands with path not only in subprocess, but anywere in output [#5657 #5607 @rjbou]
  * Add environment variables path addition [#5606 @rjbou]
  * Remove duplicated environment variables in environmenet [#5606 @rjbou]
  * Add `PATH` to replaceable variables [#5606 @rjbou]

## Github Actions
  * Add coreutils install for cheksum validation tests [#5560 @rjbou]
  * Add `wget` on Cygwin install [#5607 @rjbou]

## Doc

## Security fixes

# API updates
## opam-client
  * `OpamTreeCommand.run`: now takes an `atom` instead of `name` [#5613 @kit-ty-kate]

## opam-repository

## opam-state

## opam-solver

## opam-format
## opam-format
  * `OpamFilter`: add `expand_interpolations_in_file_full` which allows setting the output file along with the input file [#5629 @rgrinberg]
  * `OpamFilter`: expose `string_interp_regex` which allows clients to identify variable interpolations in strings [#5633 @gridbugs]

## opam-core
  * `OpamSystem.mk_temp_dir`: resolve real path with `OpamSystem.real_path` before returning it [#5654 @rjbou]
  * `OpamSystem.resolve_command`: in command resolution path, check that the file is not a directory and that it is a regular file [#5606 @rjbou - fix #5585 #5597 #5650 #5626]
  * `OpamStd.Config.env_level`: fix level parsing, it was inverted (eg, "no" gives level 1, and "yes" level 0) [#5686 @smorimoto]
