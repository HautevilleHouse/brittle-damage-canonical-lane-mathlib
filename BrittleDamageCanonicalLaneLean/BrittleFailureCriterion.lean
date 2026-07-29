import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageCanonicalLaneLean.DamageEvolutionModel

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure BrittleFailureCriterionPackage {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    {Z : CohesiveZoneModelPackage C} {E : CohesiveZoneModelEvidence Z}
    {G : GriffithEnergyBalancePackage E} {Gr : GriffithEnergyBalanceEvidence G}
    {D : DamageEvolutionModelPackage Gr} (Ev : DamageEvolutionModelEvidence D) where
  failureSurface : Prop
  criticalDamageValue : Prop
  suddenFractureCondition : Prop
  energyReleaseInstability : Prop

structure BrittleFailureCriterionEvidence {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    {Z : CohesiveZoneModelPackage C} {E : CohesiveZoneModelEvidence Z}
    {G : GriffithEnergyBalancePackage E} {Gr : GriffithEnergyBalanceEvidence G}
    {D : DamageEvolutionModelPackage Gr} {Ev : DamageEvolutionModelEvidence D}
    (B : BrittleFailureCriterionPackage Ev) where
  failureSurfaceClosed : B.failureSurface
  criticalDamageValueClosed : B.criticalDamageValue
  suddenFractureConditionClosed : B.suddenFractureCondition
  energyReleaseInstabilityClosed : B.energyReleaseInstability

def BrittleFailureCriterionClosed {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    {Z : CohesiveZoneModelPackage C} {E : CohesiveZoneModelEvidence Z}
    {G : GriffithEnergyBalancePackage E} {Gr : GriffithEnergyBalanceEvidence G}
    {D : DamageEvolutionModelPackage Gr} {Ev : DamageEvolutionModelEvidence D}
    (B : BrittleFailureCriterionPackage Ev) : Prop :=
  B.failureSurface ∧ B.criticalDamageValue ∧ B.suddenFractureCondition ∧ B.energyReleaseInstability

theorem brittle_failure_criterion_closed_from_evidence
    {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    {Z : CohesiveZoneModelPackage C} {E : CohesiveZoneModelEvidence Z}
    {G : GriffithEnergyBalancePackage E} {Gr : GriffithEnergyBalanceEvidence G}
    {D : DamageEvolutionModelPackage Gr} {Ev : DamageEvolutionModelEvidence D}
    (B : BrittleFailureCriterionPackage Ev) (Evi : BrittleFailureCriterionEvidence B) :
    BrittleFailureCriterionClosed B := by
  exact And.intro Evi.failureSurfaceClosed
    (And.intro Evi.criticalDamageValueClosed
      (And.intro Evi.suddenFractureConditionClosed Evi.energyReleaseInstabilityClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse