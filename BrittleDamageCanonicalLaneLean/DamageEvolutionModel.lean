import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageCanonicalLaneLean.GriffithEnergyBalance

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure DamageEvolutionModelPackage {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    {Z : CohesiveZoneModelPackage C} {E : CohesiveZoneModelEvidence Z}
    {G : GriffithEnergyBalancePackage E} (Gr : GriffithEnergyBalanceEvidence G) where
  internalVariable : Type u
  damageDrivingForce : Prop
  evolutionLaw : Prop
  loadingUnloadingConditions : Prop
  damageThreshold : Prop

structure DamageEvolutionModelEvidence {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    {Z : CohesiveZoneModelPackage C} {E : CohesiveZoneModelEvidence Z}
    {G : GriffithEnergyBalancePackage E} {Gr : GriffithEnergyBalanceEvidence G}
    (D : DamageEvolutionModelPackage Gr) where
  damageDrivingForceClosed : D.damageDrivingForce
  evolutionLawClosed : D.evolutionLaw
  loadingUnloadingConditionsClosed : D.loadingUnloadingConditions
  damageThresholdClosed : D.damageThreshold

def DamageEvolutionModelClosed {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    {Z : CohesiveZoneModelPackage C} {E : CohesiveZoneModelEvidence Z}
    {G : GriffithEnergyBalancePackage E} {Gr : GriffithEnergyBalanceEvidence G}
    (D : DamageEvolutionModelPackage Gr) : Prop :=
  D.damageDrivingForce ∧ D.evolutionLaw ∧ D.loadingUnloadingConditions ∧ D.damageThreshold

theorem damage_evolution_model_closed_from_evidence
    {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    {Z : CohesiveZoneModelPackage C} {E : CohesiveZoneModelEvidence Z}
    {G : GriffithEnergyBalancePackage E} {Gr : GriffithEnergyBalanceEvidence G}
    (D : DamageEvolutionModelPackage Gr) (Ev : DamageEvolutionModelEvidence D) :
    DamageEvolutionModelClosed D := by
  exact And.intro Ev.damageDrivingForceClosed
    (And.intro Ev.evolutionLawClosed
      (And.intro Ev.loadingUnloadingConditionsClosed Ev.damageThresholdClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse