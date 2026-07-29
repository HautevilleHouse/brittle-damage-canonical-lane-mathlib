import BrittleDamageCanonicalLaneLean.GriffithCriterionPackage

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure DamageEvolutionPackage where
  damageVariable : Type u
  evolutionLaw : Prop
  damageDrivingForce : Prop
  irreversibility : Prop
  timeDiscretization : Prop

structure DamageEvolutionEvidence (D : DamageEvolutionPackage) where
  damageVariableClosed : D.damageVariable
  evolutionLawClosed : D.evolutionLaw
  damageDrivingForceClosed : D.damageDrivingForce
  irreversibilityClosed : D.irreversibility
  timeDiscretizationClosed : D.timeDiscretization

def DamageEvolutionClosed (D : DamageEvolutionPackage) : Prop :=
  D.damageVariable ∧ D.evolutionLaw ∧ D.damageDrivingForce ∧
  D.irreversibility ∧ D.timeDiscretization

theorem damage_evolution_closed_from_evidence
    (D : DamageEvolutionPackage) (E : DamageEvolutionEvidence D) :
    DamageEvolutionClosed D := by
  exact And.intro E.damageVariableClosed
    (And.intro E.evolutionLawClosed
      (And.intro E.damageDrivingForceClosed
        (And.intro E.irreversibilityClosed E.timeDiscretizationClosed)))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse