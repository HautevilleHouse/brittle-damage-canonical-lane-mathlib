import BrittleDamageCanonicalLaneLean.MicrocrackPropagation

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure ContinuumDamageConstitutivePackage {F : FractureMechanicsPackage}
    {D : DamageEvolutionLawPackage F} (M : MicrocrackPropagationPackage D) where
  elasticStiffnessDegradation : Prop
  effectiveStressConcept : Prop
  damageStrainCoupling : Prop
  thermodynamicConsistency : Prop

structure ContinuumDamageConstitutiveEvidence {F : FractureMechanicsPackage}
    {D : DamageEvolutionLawPackage F} {M : MicrocrackPropagationPackage D}
    (C : ContinuumDamageConstitutivePackage M) where
  elasticStiffnessDegradationClosed : C.elasticStiffnessDegradation
  effectiveStressConceptClosed : C.effectiveStressConcept
  damageStrainCouplingClosed : C.damageStrainCoupling
  thermodynamicConsistencyClosed : C.thermodynamicConsistency

def ContinuumDamageConstitutiveClosed {F : FractureMechanicsPackage}
    {D : DamageEvolutionLawPackage F} {M : MicrocrackPropagationPackage D}
    (C : ContinuumDamageConstitutivePackage M) : Prop :=
  C.elasticStiffnessDegradation ∧ C.effectiveStressConcept ∧
  C.damageStrainCoupling ∧ C.thermodynamicConsistency

theorem continuum_damage_constitutive_closed_from_evidence
    {F : FractureMechanicsPackage} {D : DamageEvolutionLawPackage F}
    {M : MicrocrackPropagationPackage D}
    (C : ContinuumDamageConstitutivePackage M)
    (E : ContinuumDamageConstitutiveEvidence C) : ContinuumDamageConstitutiveClosed C := by
  exact And.intro E.elasticStiffnessDegradationClosed
    (And.intro E.effectiveStressConceptClosed
      (And.intro E.damageStrainCouplingClosed E.thermodynamicConsistencyClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse