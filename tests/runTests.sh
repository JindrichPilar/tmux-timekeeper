#!/usr/bin/env bash

stub_and_echo "tmux" "end_rec=false"
assert_raises "isEndOfRecording" 1

stub_and_echo "tmux" "end_rec=true"
assert_raises "isEndOfRecording" 0

assert_end "Run tests"
