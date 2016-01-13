<?php

/**
 * @file
 * Contains \Drupal\dbcd16_default_content\Normalizer\EntityReferenceRevisionsItemNormalizer.
 */

namespace Drupal\dbcd16_default_content\Normalizer;

use Drupal\Core\Entity\EntityTypeManagerInterface;
use Drupal\entity_reference_revisions\Plugin\Field\FieldType\EntityReferenceRevisionsItem;
use Drupal\hal\Normalizer\EntityReferenceItemNormalizer;
use Drupal\rest\LinkManager\LinkManagerInterface;
use Drupal\serialization\EntityResolver\EntityResolverInterface;

/**
 * Converts the Drupal entity reference revisions item to a HAL array structure.
 */
class EntityReferenceRevisionsItemNormalizer extends EntityReferenceItemNormalizer {

  /**
   * The entity type manager.
   *
   * @var \Drupal\Core\Entity\EntityTypeManagerInterface
   */
  protected $entityTypeManager;

  /**
   * The interface or class that this Normalizer supports.
   *
   * @var string
   */
  protected $supportedInterfaceOrClass = EntityReferenceRevisionsItem::class;

  /**
   * Constructs a EntityReferenceRevisionsItemNormalizer object.
   *
   * @param \Drupal\rest\LinkManager\LinkManagerInterface $link_manager
   *   The hypermedia link manager.
   * @param \Drupal\serialization\EntityResolver\EntityResolverInterface $entity_resolver
   *   The entity resolver.
   * @param \Drupal\Core\Entity\EntityTypeManagerInterface $entity_type_manager
   *   The entity type manager.
   */
  public function __construct(LinkManagerInterface $link_manager, EntityResolverInterface $entity_resolver, EntityTypeManagerInterface $entity_type_manager) {
    parent::__construct($link_manager, $entity_resolver);
    $this->entityTypeManager = $entity_type_manager;
  }

  /**
   * {@inheritdoc}
   */
  protected function constructValue($data, $context) {
    $data = parent::constructValue($data, $context);
    if ($data) {
      /** @var \Drupal\Core\Field\FieldItemInterface $field_item */
      $field_item = $context['target_instance'];
      $field_definition = $field_item->getFieldDefinition();
      $target_type = $field_definition->getSetting('target_type');
      /** @var \Drupal\Core\Entity\RevisionableInterface $entity */
      $entity = $this->entityTypeManager->getStorage($target_type)->load($data['target_id']);
      $data['target_revision_id'] = $entity->getRevisionId();
    }
    return $data;
  }

}
