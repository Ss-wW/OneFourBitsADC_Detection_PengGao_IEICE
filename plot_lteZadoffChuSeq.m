function seq = plot_lteZadoffChuSeq(R,N)
%% R,Root of the Zadoff-Chu sequene

seq = lteZadoffChuSeq(R,N);
plot(abs(xcorr(seq)./length(seq)))