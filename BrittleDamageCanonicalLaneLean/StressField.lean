import HautevilleHouse.BrittleDamageCanonicalLaneLean.MaterialDomain

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure StressField {M : MaterialDomain} where
  stressTensor : ℝ → ℝ → ℝ → ℝ
  principalStresses : ℝ × ℝ × ℝ
  vonMisesStress : ℝ
  stressStateValid : Prop

structure StressFieldEvidence {M : MaterialDomain} (S : StressField M) where
  stressTensorSymmetric : ∀ i j k l, S.stressTensor i j k l = S.stressTensor k l i j
  principalStressesReal : let (σ1, σ2, σ3) := S.principalStresses; σ1 ≥ σ2 ∧ σ2 ≥ σ3
  vonMisesNonnegative : S.vonMisesStress ≥ 0

def StressFieldClosed {M : MaterialDomain} (S : StressField M) : Prop :=
  S.stressStateValid

theorem stress_field_closed_from_evidence {M : MaterialDomain} (S : StressField M)
    (E : StressFieldEvidence S) : StressFieldClosed S := by
  exact E.stressTensorSymmetric

end BrittleDamageCanonicalLaneLean
end HautevilleHouse