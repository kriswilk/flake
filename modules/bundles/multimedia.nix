{
  features,
  ...
}:
{
  bundles.multimedia = {
    includes = [
      features.multimedia_audio
      features.multimedia_image
      features.multimedia_video
    ];
  };
}
