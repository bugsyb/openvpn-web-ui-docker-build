# openvpn-web-ui-docker-build
Scripts simplifying build of openvpn-web-ui (https://github.com/adamwalach/openvpn-web-ui) for ARMv8

# Note:
The great development Adam Walach did, doesn't seem to be maintained anymore, PRs were not accepted/rejeceted for a long time.

Number of other developers forked and made various contributions nicely summarized by @bnhf here:
- https://github.com/adamwalach/openvpn-web-ui/issues/38#issuecomment-1046097455

## As of 2023.12, the most valuable UIs identified are:
a) based on original Adam Walach work:
- OpenVPN Admin Plus by @bnhf - https://github.com/bnhf/openvpn-admin-plus
- OpenVPN UI by @d3vilh - https://github.com/d3vilh/openvpn-ui

b) completely separate (no code investigation done, just quick check)
- ovpn-admin by @flant - https://github.com/flant/ovpn-admin

At the same time the scripts in this repo do not work anymore as current **Go** syntax/requirements changed and scripts would need to be amended to stick to older/unsupported Go version.
Given existance of above projects, scripts are not going to be maintained and are left just as reference as are used in at least one of above projects (OpenVPN-UI) where any remarks to source/credits have unfortunately been removed violating license (@d3vilh added credit back after raising it with him).
