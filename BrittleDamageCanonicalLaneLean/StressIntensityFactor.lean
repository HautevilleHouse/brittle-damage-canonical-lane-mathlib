import HautevilleHouse.BrittleDamageCanonicalLaneLean.CrackPropagation

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure StressIntensityFactorPackage {C : CrackPropagationPackage} where
  stressIntensity : Type
  modeIMagnitude : ℝ
  modeIIMagnitude : ℝ
  fractureToughnessRelation : Prop

structure StressIntensityFactorEvidence {C : CrackPropagationPackage}
    (S : StressIntensityFactorPackage C) where
  modeIMagnitudeClosed : S.modeIMagnitude > 0
  modeIIMagnitudeClosed : S.modeIIMagnitude > 0
  fractureToughnessRelationClosed : S.fractureToughnessRelation

def StressIntensityFactorClosed {C : CrackPropagationPackage}
    (S : StressIntensityFactorPackage C) : Prop :=
  S.modeIMagnitude > 0 ∧ S.modeIIMagnitude > 0 ∧ S.fractureToughnessRelation

theorem stress_intensity_factor_closed_from_evidence
    {C : CrackPropagationPackage} (S : StressIntensityFactorPackage C)
    (E : StressIntensityFactorEvidence S) : StressIntensityFactorClosed S := by
  exact And.intro E.modeIMagnitudeClosed (And.intro E.modeIIMagnitudeClosed E.fractureToughnessRelationClosed)

end BrittleDamageCanonicalLaneLean
end HautevilleHouse