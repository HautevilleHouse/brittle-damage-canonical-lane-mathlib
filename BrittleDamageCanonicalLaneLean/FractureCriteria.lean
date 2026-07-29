import BrittleDamageCanonicalLaneLean.StressStrainField

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure FractureCriteriaPackage {G : StressFieldPackage} (S : StressStrainFieldPackage G) where
  griffithEnergyRelease : Prop
  stressIntensityFactor : Prop
  fractureToughnessBound : Prop
  crackGrowthCondition : Prop

structure FractureCriteriaEvidence {G : StressFieldPackage} {S : StressStrainFieldPackage G}
    (F : FractureCriteriaPackage S) where
  griffithEnergyReleaseClosed : F.griffithEnergyRelease
  stressIntensityFactorClosed : F.stressIntensityFactor
  fractureToughnessBoundClosed : F.fractureToughnessBound
  crackGrowthConditionClosed : F.crackGrowthCondition

def FractureCriteriaClosed {G : StressFieldPackage} {S : StressStrainFieldPackage G}
    (F : FractureCriteriaPackage S) : Prop :=
  F.griffithEnergyRelease ∧ F.stressIntensityFactor ∧ F.fractureToughnessBound ∧ F.crackGrowthCondition

theorem fracture_criteria_closed_from_evidence
    {G : StressFieldPackage} {S : StressStrainFieldPackage G}
    (F : FractureCriteriaPackage S) (E : FractureCriteriaEvidence F) :
    FractureCriteriaClosed F := by
  exact And.intro E.griffithEnergyReleaseClosed
    (And.intro E.stressIntensityFactorClosed
      (And.intro E.fractureToughnessBoundClosed E.crackGrowthConditionClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse