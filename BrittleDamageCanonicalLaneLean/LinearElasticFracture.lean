import HautevilleHouse.BrittleDamageCanonicalLaneLean.BrittleDamageAdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure StressIntensityPackage where
  kIC : ℝ
  kIIC : ℝ
  kIIIC : ℝ
  tipFieldSingular : Prop
  criticalStressReached : Prop

structure StressIntensityEvidence (S : StressIntensityPackage) where
  kICClosed : S.kIC > 0
  kIICClosed : S.kIIC > 0
  kIIICClosed : S.kIIIC > 0
  tipFieldSingularClosed : S.tipFieldSingular
  criticalStressReachedClosed : S.criticalStressReached

def StressIntensityClosed (S : StressIntensityPackage) : Prop :=
  S.kIC > 0 ∧ S.kIIC > 0 ∧ S.kIIIC > 0 ∧ S.tipFieldSingular ∧ S.criticalStressReached

theorem stress_intensity_closed_from_evidence (S : StressIntensityPackage)
    (E : StressIntensityEvidence S) : StressIntensityClosed S := by
  exact And.intro E.kICClosed (And.intro E.kIICClosed (And.intro E.kIIICClosed
    (And.intro E.tipFieldSingularClosed E.criticalStressReachedClosed)))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse