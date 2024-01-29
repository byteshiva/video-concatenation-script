# flake.nix

{
  description = "Nix flake for combining multiple video files into one.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    devShell.x86_64-linux =
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in pkgs.mkShell {
        buildInputs = [
          pkgs.ffmpeg
        ];

        shellHook = ''
          echo "Entering the development environment!"
        '';
      };

    devShells = rec {
      default = self.devShell.x86_64-linux;
    };
  };
}
