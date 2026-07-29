import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageCanonicalLaneLean.CohesiveZoneModel

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure GriffithEnergyBalancePackage {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    {Z : CohesiveZoneModelPackage C} (E : CohesiveZoneModelEvidence Z) where
  elasticStrainEnergyReleaseRate : Prop
  criticalEnergyReleaseRate : Prop
  crackPropagationCriterion : Prop
  stableCrackGrowthCondition : Prop

structure GriffithEnergyBalanceEvidence {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    {Z : CohesiveZoneModelPackage C} {E : CohesiveZoneModelEvidence Z}
    (G : GriffithEnergyBalancePackage E) where
  elasticStrainEnergyReleaseRateClosed : G.elasticStrainEnergyReleaseRate
  criticalEnergyReleaseRateClosed : G.criticalEnergyReleaseRate
  crackPropagationCriterionClosed : G.crackPropagationCriterion
  stableCrackGrowthConditionClosed : G.stableCrackGrowthCondition

def GriffithEnergyBalanceClosed {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    {Z : CohesiveZoneModelPackage C} {E : CohesiveZoneModelEvidence Z}
    (G : GriffithEnergyBalancePackage E) : Prop :=
  G.elasticStrainEnergyReleaseRate ∧ G.criticalEnergyReleaseRate ∧
  G.crackPropagationCriterion ∧ G.stableCrackGrowthCondition

theorem griffith_energy_balance_closed_from_evidence
    {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    {Z : CohesiveZoneModelPackage C} {E : CohesiveZoneModelEvidence Z}
    (G : GriffithEnergyBalancePackage E) (Ev : GriffithEnergyBalanceEvidence G) :
    GriffithEnergyBalanceClosed G := by
  exact And.intro Ev.elasticStrainEnergyReleaseRateClosed
    (And.intro Ev.criticalEnergyReleaseRateClosed
      (And.intro Ev.crackPropagationCriterionClosed Ev.stableCrackGrowthConditionClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse