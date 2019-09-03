function seq = lteZadoffChuSeq(R, N)
%LTEZADOFFCHUSEQ Generate a root Zadoff-Chu sequence of complex symbols.
%
%   SEQ = LTEZADOFFCHUSEQ(R, N) generates the Rth root Zadoff-Chu sequence
%   of length N as per LTE specifications. The output SEQ is an N-length
%   column vector of complex symbols.
%
%   Example:
%       % Generate the 25th root length-63 Zadoff-Chu sequence 
%       seq = lteZadoffChuSeq(25, 63);
%
%   Reference: 
%   3rd Generation Partnership Project, Technical Specification Group Radio
%   Access Network, Evolved Universal Terrestrial Radio Access (E-UTRA),
%   Physical channels and modulation, Release 10, 3GPP TS 36.211, v10.0.0,
%   2010-12.
%
%   See also comm.PNSequence.

%   Copyright 2012 The MathWorks, Inc.

%#codegen

% Check for number of inputs
coder.internal.errorIf(nargin>2, 'MATLAB:TooManyInputs');
coder.internal.errorIf(nargin<2, 'MATLAB:narginchk:notEnoughInputs');

% Check for valid R
coder.internal.errorIf( (~isscalar(R) || ~isnumeric(R) || ~isreal(R) || ...
                        ~isfinite(R) || R~=floor(R) || R<=0),...
                        'comm:lteZadoffChuSeq:InvalidR');

% Check for valid N - odd lengths only
coder.internal.errorIf( (~isscalar(N) || ~isnumeric(N) || ~isreal(N) || ...
                         ~isfinite(N) || N~=floor(N) || N<=0 || ...
                         mod(N, 2) == 0), 'comm:lteZadoffChuSeq:InvalidN');

% Check for relative primeness between N and R
coder.internal.errorIf(gcd(N, R) ~= 1, ...
                       'comm:lteZadoffChuSeq:NotRelativelyPrime');

m = (0:N-1).';
seq = exp( -1i * pi * R * m.*(m+1) / N );

% [EOF]
