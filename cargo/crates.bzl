"""
cargo-raze crate workspace functions

DO NOT EDIT! Replaced on runs of cargo-raze
"""
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")

def _new_http_archive(name, **kwargs):
    if not native.existing_rule(name):
        http_archive(name=name, **kwargs)

def _new_git_repository(name, **kwargs):
    if not native.existing_rule(name):
        new_git_repository(name=name, **kwargs)

def raze_fetch_remote_crates():

    _new_http_archive(
        name = "raze__derive_more__0_99_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/derive_more/derive_more-0.99.2.crate",
        type = "tar.gz",
        sha256 = "2159be042979966de68315bce7034bb000c775f22e3e834e1c52ff78f041cae8",
        strip_prefix = "derive_more-0.99.2",
        build_file = Label("//cargo/remote:derive_more-0.99.2.BUILD")
    )

    _new_http_archive(
        name = "raze__proc_macro2__1_0_6",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/proc-macro2/proc-macro2-1.0.6.crate",
        type = "tar.gz",
        sha256 = "9c9e470a8dc4aeae2dee2f335e8f533e2d4b347e1434e5671afc49b054592f27",
        strip_prefix = "proc-macro2-1.0.6",
        build_file = Label("//cargo/remote:proc-macro2-1.0.6.BUILD")
    )

    _new_http_archive(
        name = "raze__quote__1_0_2",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/quote/quote-1.0.2.crate",
        type = "tar.gz",
        sha256 = "053a8c8bcc71fcce321828dc897a98ab9760bef03a4fc36693c231e5b3216cfe",
        strip_prefix = "quote-1.0.2",
        build_file = Label("//cargo/remote:quote-1.0.2.BUILD")
    )

    _new_http_archive(
        name = "raze__syn__1_0_8",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/syn/syn-1.0.8.crate",
        type = "tar.gz",
        sha256 = "661641ea2aa15845cddeb97dad000d22070bb5c1fb456b96c1cba883ec691e92",
        strip_prefix = "syn-1.0.8",
        build_file = Label("//cargo/remote:syn-1.0.8.BUILD")
    )

    _new_http_archive(
        name = "raze__unicode_xid__0_2_0",
        url = "https://crates-io.s3-us-west-1.amazonaws.com/crates/unicode-xid/unicode-xid-0.2.0.crate",
        type = "tar.gz",
        sha256 = "826e7639553986605ec5979c7dd957c7895e93eabed50ab2ffa7f6128a75097c",
        strip_prefix = "unicode-xid-0.2.0",
        build_file = Label("//cargo/remote:unicode-xid-0.2.0.BUILD")
    )

