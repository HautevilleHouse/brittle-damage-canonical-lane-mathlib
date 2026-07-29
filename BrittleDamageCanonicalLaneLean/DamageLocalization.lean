import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BrittleDamageCanonicalLaneLean

structure DamageLocalizationPackage where
  damageField : Type u
  localizationZone : Type v
  concentrationFactor : Prop
  strainSoftening : Prop
  energyDissipation : Prop

structure DamageLocalizationEvidence (D : DamageLocalizationPackage) where
  concentrationFactorClosed : D.concentrationFactor
  strainSofteningClosed : D.strainSoftening
  energyDissipationClosed : D.energyDissipation

def DamageLocalizationClosed (D : DamageLocalizationPackage) : Prop :=
  D.concentrationFactor ∧ D.strainSoftening ∧ D.energyDissipation

theorem damage_localization_closed_from_evidence (D : DamageLocalizationPackage)
    (E : DamageLocalizationEvidence D) : DamageLocalizationClosed D := by
  exact And.intro E.concentrationFactorClosed
    (And.intro E.strainSofteningClosed E.energyDissipationClosed)

end BrittleDamageCanonicalLaneLean
end HautevilleHouse