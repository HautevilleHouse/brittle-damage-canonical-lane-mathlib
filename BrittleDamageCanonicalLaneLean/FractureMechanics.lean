import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BrittleDamageCanonicalLaneLean.BrittleDamageObject

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure FractureMechanicsPackage (O : BrittleDamageObject) where
  linearElasticFracture : Prop
  energyReleaseRate : Prop
  griffithCriterion : Prop
  fractureMode : Prop
  criticalCrackLength : Prop

structure FractureMechanicsEvidence (O : BrittleDamageObject) (F : FractureMechanicsPackage O) where
  linearElasticFractureClosed : F.linearElasticFracture
  energyReleaseRateClosed : F.energyReleaseRate
  griffithCriterionClosed : F.griffithCriterion
  fractureModeClosed : F.fractureMode
  criticalCrackLengthClosed : F.criticalCrackLength

def FractureMechanicsClosed (O : BrittleDamageObject) (F : FractureMechanicsPackage O) : Prop :=
  F.linearElasticFracture ∧ F.energyReleaseRate ∧ F.griffithCriterion ∧ F.fractureMode ∧ F.criticalCrackLength

theorem fracture_mechanics_closed_from_evidence (O : BrittleDamageObject) (F : FractureMechanicsPackage O) (E : FractureMechanicsEvidence O F) :
    FractureMechanicsClosed O F := by
  exact And.intro E.linearElasticFractureClosed
    (And.intro E.energyReleaseRateClosed
      (And.intro E.griffithCriterionClosed
        (And.intro E.fractureModeClosed E.criticalCrackLengthClosed)))

end BrittleDamageCanonicalLaneLean
end HautevilleHouse