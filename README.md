# E-Bank-Solution
## Assigné: Développement de l'application e-bank

### Contexte
La digitalisation des services bancaires est devenue incontournable pour offrir aux clients une expérience fluide et accessible. Cette application e-bank vise à fournir une plateforme sécurisée et intuitive permettant aux utilisateurs de gérer leurs comptes bancaires et d'effectuer des opérations financières en ligne. Vous êtes développeur junior au sein du service informatique de l'enseigne bancaire Bank Solutions. Jusqu'à présent, cette banque se concentrait principalement sur la fourniture de services bancaires sur site. Votre manager vous a confié la tâche de développer la partie back-end de l'application e-bank.

### User Stories

#### Gestion des comptes
1. **Création de comptes bancaires**
   - **En tant qu'utilisateur**, je veux pouvoir créer un nouveau compte bancaire (courant, épargne, etc.) pour gérer mes finances.
     - Attributs: Type de compte (Courant, Épargne, etc.), Solde initial, Date de création.

2. **Consultation des soldes et historiques de transactions**
   - **En tant qu'utilisateur**, je veux consulter le solde et l'historique des transactions de mes comptes pour suivre mes dépenses et revenus.
     - Attributs: ID de la transaction, Date et heure, Montant, Type de transaction (Crédit, Débit), Description.

3. **Fermeture de comptes**
   - **En tant qu'utilisateur**, je veux pouvoir fermer un compte bancaire pour ne plus l'utiliser, en indiquant la raison de la fermeture.

#### Gestion des cartes bancaires
1. **Consultation des informations de la carte**
   - **En tant qu'utilisateur**, je veux pouvoir consulter les informations de ma carte bancaire (numéro, date d'expiration) pour connaître les détails de ma carte.
     - Attributs: Numéro de carte, Date d'expiration, Type de carte (Débit, Crédit).

2. **Activation et désactivation de la carte**
   - **En tant qu'utilisateur**, je veux pouvoir activer ou désactiver ma carte bancaire pour sécuriser mes transactions.

3. **Blocage en cas de perte ou de vol**
   - **En tant qu'utilisateur**, je veux pouvoir bloquer ma carte bancaire en cas de perte ou de vol pour éviter une utilisation frauduleuse, en indiquant la raison du blocage.

#### Transferts d'argent
1. **Transferts internes entre comptes du même utilisateur**
   - **En tant qu'utilisateur**, je veux pouvoir transférer de l'argent entre mes propres comptes pour gérer mes fonds, en indiquant le montant et la description.

2. **Transferts externes vers des comptes dans d'autres banques**
   - **En tant qu'utilisateur**, je veux pouvoir transférer de l'argent vers des comptes externes pour effectuer des paiements ou envoyer de l'argent, en indiquant les détails du compte externe (numéro de compte, banque, etc.), le montant et la description.

3. **Gestion des bénéficiaires**
   - **En tant qu'utilisateur**, je veux pouvoir ajouter, modifier ou supprimer des bénéficiaires pour faciliter mes transferts externes, en indiquant son nom et les détails du compte (numéro de compte, banque, etc.).

### Exigences techniques
1. **Structuration du projet**
   - La structure du projet doit suivre les bonnes pratiques recommandées pour une application Spring Boot.

2. **Documentation du Code**
   - Description des responsabilités de chaque classe et méthode, ainsi que des détails sur les paramètres et les valeurs de retour.

3. **Logique métier des opérations bancaires**
   - Validation des données lors de la création et de la fermeture des comptes (ex: solde suffisant avant la fermeture).
   - Gestion des exceptions pour les opérations illégales (ex: tentative de transfert à partir d'un compte fermé).
   - Validation des montants avant les transferts (ex: montant positif, solde suffisant).

### Modalités pédagogiques
- **Travail:** individuel
- **Temporalité:** 5 jours
  - **Date de lancement du brief:** 01/07/2024 à 10:00
  - **Date limite de soumission de la conception:** 02/07/2024 à 12:30
  - **Date limite de soumission finale:** 05/07/2024 à 23:59

### Modalités d'évaluation
- L'évaluation du projet se déroulera sur une durée de 20 minutes, selon le planning suivant:
  - 10 minutes: Tester les APIs + Explication partie code.
  - 10 minutes: Mise en situation et évaluation des savoirs (Q/A).

### Livrables
1. Lien de la planification des tâches (Trello/Jira).
2. Lien de collection des tests des APIs avec Postman.
3. Lien vers le repository GitHub contenant:
   - README.
   - Le code source de l'application avec tous les fichiers nécessaires.
   - Conception UML (image des trois diagrammes).

### Critères de performance
- Fonctionnalités complètes et fonctionnelles conformes aux spécifications.
- Gestion des exceptions.
- Tests des API avec Postman.
- Tests unitaires pour assurer la qualité et la fiabilité de l’application (JUnit).
- Respect des délais de livraison.
