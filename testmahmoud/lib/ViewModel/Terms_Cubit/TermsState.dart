abstract class TermsState{}
class TermsLoading extends TermsState{}
class TermsSuccess extends TermsState{}
class TermsInit extends TermsState{}
class TermsError extends TermsState{
  final error;
  TermsError(this.error);
}