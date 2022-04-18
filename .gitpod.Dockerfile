FROM gitpod/workspace-base

RUN sudo apt-get update && sudo apt-get install -y --no-install-recommends \
        opam \
    && sudo apt-get -y clean \
    && sudo rm -r /var/lib/apt/lists/*

USER gitpod

RUN echo '. /home/gitpod/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true' >> /home/gitpod/.bashrc
RUN opam init --disable-sandboxing

RUN eval $(opam env) && opam repository add satysfi-external https://github.com/gfngfn/satysfi-external-repo.git
RUN eval $(opam env) && opam repository add satyrographos https://github.com/na4zagin3/satyrographos-repo.git
RUN eval $(opam env) && opam update

RUN eval $(opam env) && opam install --yes satysfi satysfi-dist satyrographos
RUN eval $(opam env) && satyrographos install
