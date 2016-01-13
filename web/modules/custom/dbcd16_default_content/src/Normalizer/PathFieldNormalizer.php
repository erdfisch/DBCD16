<?php

/**
 * @file
 * Contains \Drupal\dbcd16_default_content\Normalizer\PathFieldNormalizer.
 */

namespace Drupal\dbcd16_default_content\Normalizer;

use Drupal\Core\Language\LanguageInterface;
use Drupal\Core\Path\AliasStorageInterface;
use Drupal\hal\Normalizer\FieldNormalizer;
use Drupal\path\Plugin\Field\FieldType\PathFieldItemList;

/**
 * Provides a normalizer for path fields.
 *
 * The generic field normalizer is useless for path fields because they do not
 * contain any field items upon loading, so they are always skipped. In contrast
 * this normalizer checks whether an alias exists for the entity's path and, if
 * so creates a field item containing the alias dynamically. That way the alias
 * will end up in the normalized entity. If the entity is then denormalized and
 * saved, an alias will get created by PathItem::postSave(). Note that because
 * path aliases do not support UUIDs we do not normalize the alias' identifier
 * ("pid").
 *
 * @see \Drupal\hal\Normalizer\FieldNormalizer::normalizeFieldItems()
 * @see \Drupal\path\Plugin\Field\FieldType\PathItem::postSave()
 *
 * @todo Provide this upstream in https://www.drupal.org/node/2649646
 */
class PathFieldNormalizer extends FieldNormalizer {

  /**
   * {@inheritdoc}
   */
  protected $supportedInterfaceOrClass = PathFieldItemList::class;

  /**
   * The path alias storage.
   *
   * @var \Drupal\Core\Path\AliasStorageInterface
   */
  protected $aliasStorage;

  /**
   * Constructs a PathFieldItemNormalizer object
   * .
   * @param \Drupal\Core\Path\AliasStorageInterface $alias_storage
   *   The path alias storage.
   */
  public function __construct(AliasStorageInterface $alias_storage) {
    $this->aliasStorage = $alias_storage;
  }

  /**
   * {@inheritdoc}
   */
  protected function normalizeFieldItems($field, $format, $context) {
    /** @var \Drupal\Core\Field\FieldItemListInterface $field */
    $normalized_field_items = [];

    $entity = $field->getEntity();
    /** @see \Drupal\path\Plugin\Field\FieldWidget\PathWidget::formElement() */
    if (!$entity->isNew()) {
      $conditions = ['source' => '/' . $entity->toUrl()->getInternalPath()];
      if (isset($context['langcode']) && ($context['langcode'] != LanguageInterface::LANGCODE_NOT_SPECIFIED)) {
        $conditions['langcode'] = $context['langcode'];
      }
      $path = $this->aliasStorage->load($conditions);
      if ($path !== FALSE) {
        $field_item = $field->appendItem(['alias' => $path['alias']]);
        $normalized_field_items[] = $this->serializer->normalize($field_item, $format, $context);
      }
    }

    return $normalized_field_items;
  }

}
