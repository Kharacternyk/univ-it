{
  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        config = {
          android_sdk.accept_license = true;
          allowUnfree = true;
        };
      };
      sdk = (pkgs.androidenv.composeAndroidPackages {
        buildToolsVersions = [
          "34.0.0"
          "30.0.3"
        ];
        platformVersions = [
          "33"
          "32"
          "31"
        ];
        abiVersions = [
          "arveabi-v7a"
          "arm64-v8a"
        ];
      }).androidsdk;
    in
    {
      devShell = pkgs.mkShell {
        GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride="
          + "${sdk}/libexec/android-sdk/build-tools/34.0.0/aapt2";
        ANDROID_SDK_ROOT = "${sdk}/libexec/android-sdk";
        buildInputs = [
          sdk
          pkgs.jdk17
        ];
      };
    });
}
