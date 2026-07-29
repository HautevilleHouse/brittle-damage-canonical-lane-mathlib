import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageCanonicalLaneLean.FractureMechanicsPackage

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure CohesiveZoneModelPackage {F : FractureMechanicsPackage} (C : FractureMechanicsEvidence F) where
  tractionSeparationLaw : Prop
  cohesiveStrength : Prop
  fractureEnergy : Prop
  softeningBehavior : Prop

structure CohesiveZoneModelEvidence {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    (Z : CohesiveZoneModelPackage C) where
  tractionSeparationLawClosed : Z.tractionSeparationLaw
  cohesiveStrengthClosed : Z.cohesiveStrength
  fractureEnergyClosed : Z.fractureEnergy
  softeningBehaviorClosed : Z.softeningBehavior

def CohesiveZoneModelClosed {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    (Z : CohesiveZoneModelPackage C) : Prop :=
  Z.tractionSeparationLaw ∧ Z.cohesiveStrength ∧ Z.fractureEnergy ∧ Z.softeningBehavior

theorem cohesive_zone_model_closed_from_evidence {F : FractureMechanicsPackage} {C : FractureMechanicsEvidence F}
    (Z : CohesiveZoneModelPackage C) (E : CohesiveZoneModelEvidence Z) : CohesiveZoneModelClosed Z := by
  exact And.intro E.tractionSeparationLawClosed
    (And.intro E.cohesiveStrengthClosed
      (And.intro E.fractureEnergyClosed E.softeningBehaviorClosed))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse