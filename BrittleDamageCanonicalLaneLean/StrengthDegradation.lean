import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure StrengthDegradationPackage where
  residualStrength : Type u
  damageVariable : Type v
  loadingHistory : Prop
  stiffnessReduction : Prop
  ultimateFailure : Prop

structure StrengthDegradationEvidence (S : StrengthDegradationPackage) where
  loadingHistoryClosed : S.loadingHistory
  stiffnessReductionClosed : S.stiffnessReduction
  ultimateFailureClosed : S.ultimateFailure

def StrengthDegradationClosed (S : StrengthDegradationPackage) : Prop :=
  S.loadingHistory ∧ S.stiffnessReduction ∧ S.ultimateFailure

theorem strength_degradation_closed_from_evidence (S : StrengthDegradationPackage)
    (E : StrengthDegradationEvidence S) : StrengthDegradationClosed S := by
  exact And.intro E.loadingHistoryClosed
    (And.intro E.stiffnessReductionClosed E.ultimateFailureClosed)

end BrittleDamageCanonicalLaneLean
end HautevilleHouse