import HautevilleHouse.BrittleDamageCanonicalLaneLean.StressField

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure FractureCriterion {M : MaterialDomain} {S : StressField M} where
  griffithEnergyBalance : Prop
  stressIntensityFactor : ℝ → ℝ → ℝ
  criticalStressIntensity : ℝ
  criterionSatisfied : Prop

structure FractureCriterionEvidence {M : MaterialDomain} {S : StressField M}
    (F : FractureCriterion M S) where
  energyBalanceClosed : F.griffithEnergyBalance
  stressIntensityFactorBounded : ∀ x y, F.stressIntensityFactor x y ≤ F.criticalStressIntensity

def FractureCriterionClosed {M : MaterialDomain} {S : StressField M}
    (F : FractureCriterion M S) : Prop :=
  F.criterionSatisfied

theorem fracture_criterion_closed_from_evidence {M : MaterialDomain} {S : StressField M}
    (F : FractureCriterion M S) (E : FractureCriterionEvidence F) :
    FractureCriterionClosed F := by
  exact E.energyBalanceClosed

end BrittleDamageCanonicalLaneLean
end HautevilleHouse